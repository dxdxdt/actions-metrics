# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-03-30T18:50:24.572788+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.803 |  |
| ap-east-2 | 0.738 |  |
| ap-northeast-1 | 0.635 |  |
| ap-northeast-2 | 0.736 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.955 |  |
| ap-southeast-4 | 0.856 |  |
| ap-southeast-5 | 0.907 |  |
| ap-southeast-6 | 0.878 |  |
| ap-southeast-7 | 0.994 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.302 |  |
| eu-central-1 | 0.384 |  |
| eu-central-2 | 0.409 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.420 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.346 |  |
| eu-west-3 | 0.363 |  |
| il-central-1 | 0.569 |  |
| me-central-1 | 0.756 |  |
| me-south-1 | 0.709 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.497 |  |
| us-east-1 | 0.058 | 4401 |
| us-east-2 | 0.082 | 1467 |
| us-gov-east-1 | 0.102 | 1615 |
| us-gov-west-1 | 0.309 | 190 |
| us-west-1 | 0.257 | 3321 |
| us-west-2 | 0.312 | 152 |

