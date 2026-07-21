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
Updated: 2026-07-21T20:15:41.591379+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.611 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.776 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.882 |  |
| ap-southeast-6 | 0.811 |  |
| ap-southeast-7 | 0.964 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.433 |  |
| eu-north-1 | 0.462 |  |
| eu-south-1 | 0.430 |  |
| eu-south-2 | 0.440 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.356 |  |
| eu-west-3 | 0.388 |  |
| il-central-1 | 0.572 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.071 | 4895 |
| us-east-2 | 0.085 | 1659 |
| us-gov-east-1 | 0.101 | 1772 |
| us-gov-west-1 | 0.287 | 206 |
| us-west-1 | 0.252 | 3814 |
| us-west-2 | 0.293 | 167 |

