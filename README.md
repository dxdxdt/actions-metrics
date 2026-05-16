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
Updated: 2026-05-16T13:03:56.530095+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.660 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.737 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.829 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.491 |  |
| eu-north-1 | 0.513 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.511 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.461 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.200 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.127 | 4646 |
| us-east-2 | 0.086 | 1596 |
| us-gov-east-1 | 0.088 | 1694 |
| us-gov-west-1 | 0.234 | 195 |
| us-west-1 | 0.180 | 3567 |
| us-west-2 | 0.233 | 158 |

