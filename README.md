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
Updated: 2026-08-12T12:50:02.703708+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.679 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.813 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.726 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.241 | 18 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.529 |  |
| eu-north-1 | 0.583 |  |
| eu-south-1 | 0.535 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.920 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.257 |  |
| sa-east-1 | 0.634 |  |
| us-east-1 | 0.176 | 4978 |
| us-east-2 | 0.195 | 1679 |
| us-gov-east-1 | 0.221 | 1822 |
| us-gov-west-1 | 0.169 | 221 |
| us-west-1 | 0.176 | 3930 |
| us-west-2 | 0.170 | 176 |

