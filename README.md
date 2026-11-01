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
Updated: 2026-11-01T08:29:21.714429+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.710 |  |
| ap-east-1 | 0.554 |  |
| ap-east-2 | 0.507 |  |
| ap-northeast-1 | 0.418 |  |
| ap-northeast-2 | 0.499 |  |
| ap-northeast-3 | 0.437 |  |
| ap-south-1 | 0.673 |  |
| ap-south-2 | 0.746 |  |
| ap-southeast-1 | 0.607 |  |
| ap-southeast-2 | 0.535 |  |
| ap-southeast-3 | 0.655 |  |
| ap-southeast-4 | 0.599 |  |
| ap-southeast-5 | 0.625 |  |
| ap-southeast-6 | 0.556 |  |
| ap-southeast-7 | 0.686 |  |
| ca-central-1 | 0.100 | 18 |
| ca-west-1 | 0.169 |  |
| eu-central-1 | 0.348 |  |
| eu-central-2 | 0.364 |  |
| eu-north-1 | 0.386 |  |
| eu-south-1 | 0.360 |  |
| eu-south-2 | 0.365 |  |
| eu-west-1 | 0.297 |  |
| eu-west-2 | 0.316 |  |
| eu-west-3 | 0.343 |  |
| il-central-1 | 0.468 |  |
| me-central-1 | 0.608 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.145 |  |
| sa-east-1 | 0.440 |  |
| us-east-1 | 0.097 | 5168 |
| us-east-2 | 0.083 | 1718 |
| us-gov-east-1 | 0.076 | 1958 |
| us-gov-west-1 | 0.173 | 241 |
| us-west-1 | 0.131 | 4203 |
| us-west-2 | 0.175 | 195 |

