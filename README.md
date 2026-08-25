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
Updated: 2026-08-25T22:18:20.578573+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.668 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.767 |  |
| ap-southeast-5 | 0.842 |  |
| ap-southeast-6 | 0.757 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.194 | 18 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.452 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.519 |  |
| eu-south-1 | 0.484 |  |
| eu-south-2 | 0.490 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.431 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.555 |  |
| us-east-1 | 0.120 | 5064 |
| us-east-2 | 0.140 | 1684 |
| us-gov-east-1 | 0.152 | 1885 |
| us-gov-west-1 | 0.250 | 228 |
| us-west-1 | 0.200 | 4054 |
| us-west-2 | 0.251 | 188 |

