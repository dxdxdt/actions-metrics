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
Updated: 2026-03-13T22:22:15.888594+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.999 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.555 |  |
| ap-south-1 | 0.935 |  |
| ap-south-2 | 0.956 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.839 |  |
| ap-southeast-4 | 0.731 |  |
| ap-southeast-5 | 0.806 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.517 |  |
| eu-north-1 | 0.551 |  |
| eu-south-1 | 0.515 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.424 |  |
| eu-west-2 | 0.464 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.826 |  |
| mx-central-1 | 0.190 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.141 | 4277 |
| us-east-2 | 0.128 | 1422 |
| us-gov-east-1 | 0.111 | 1572 |
| us-gov-west-1 | 0.182 | 183 |
| us-west-1 | 0.195 | 3220 |
| us-west-2 | 0.183 | 146 |

