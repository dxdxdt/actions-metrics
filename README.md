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
Updated: 2026-03-13T18:31:50.955876+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.965 |  |
| ap-east-1 | 0.732 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.584 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.813 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.487 |  |
| eu-north-1 | 0.509 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.395 |  |
| eu-west-2 | 0.429 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.798 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.117 | 4277 |
| us-east-2 | 0.095 | 1422 |
| us-gov-east-1 | 0.090 | 1570 |
| us-gov-west-1 | 0.212 | 182 |
| us-west-1 | 0.234 | 3219 |
| us-west-2 | 0.228 | 146 |

