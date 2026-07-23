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
Updated: 2026-07-23T23:54:47.504523+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.759 |  |
| ap-east-2 | 0.704 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.684 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.842 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.894 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.161 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.467 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.388 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.100 | 4903 |
| us-east-2 | 0.135 | 1660 |
| us-gov-east-1 | 0.127 | 1777 |
| us-gov-west-1 | 0.260 | 206 |
| us-west-1 | 0.203 | 3825 |
| us-west-2 | 0.260 | 168 |

