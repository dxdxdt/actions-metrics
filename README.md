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
Updated: 2026-08-26T03:46:50.145967+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.642 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.854 |  |
| ap-south-2 | 0.859 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.673 |  |
| ap-southeast-3 | 0.840 |  |
| ap-southeast-4 | 0.718 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.712 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.224 | 18 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.519 |  |
| eu-north-1 | 0.562 |  |
| eu-south-1 | 0.520 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.451 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.650 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.161 | 5067 |
| us-east-2 | 0.172 | 1684 |
| us-gov-east-1 | 0.170 | 1885 |
| us-gov-west-1 | 0.201 | 228 |
| us-west-1 | 0.149 | 4055 |
| us-west-2 | 0.204 | 188 |

