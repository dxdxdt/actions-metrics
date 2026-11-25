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
Updated: 2026-11-25T11:55:48.478202+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.718 |  |
| ap-east-1 | 0.529 |  |
| ap-east-2 | 0.482 |  |
| ap-northeast-1 | 0.391 |  |
| ap-northeast-2 | 0.470 |  |
| ap-northeast-3 | 0.409 |  |
| ap-south-1 | 0.720 |  |
| ap-south-2 | 0.758 |  |
| ap-southeast-1 | 0.585 |  |
| ap-southeast-2 | 0.507 |  |
| ap-southeast-3 | 0.631 |  |
| ap-southeast-4 | 0.571 |  |
| ap-southeast-5 | 0.598 |  |
| ap-southeast-6 | 0.524 |  |
| ap-southeast-7 | 0.663 |  |
| ca-central-1 | 0.158 | 18 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.385 |  |
| eu-central-2 | 0.389 |  |
| eu-north-1 | 0.406 |  |
| eu-south-1 | 0.393 |  |
| eu-south-2 | 0.382 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.341 |  |
| eu-west-3 | 0.366 |  |
| il-central-1 | 0.493 |  |
| me-central-1 | 0.653 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.684 |  |
| mx-central-1 | 0.142 |  |
| sa-east-1 | 0.464 |  |
| us-east-1 | 0.122 | 5195 |
| us-east-2 | 0.121 | 1730 |
| us-gov-east-1 | 0.131 | 1967 |
| us-gov-west-1 | 0.157 | 249 |
| us-west-1 | 0.106 | 4226 |
| us-west-2 | 0.157 | 200 |

