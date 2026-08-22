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
Updated: 2026-08-22T11:14:05.052948+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.019 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.589 |  |
| ap-northeast-1 | 0.471 |  |
| ap-northeast-2 | 0.581 |  |
| ap-northeast-3 | 0.498 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.735 |  |
| ap-southeast-2 | 0.616 |  |
| ap-southeast-3 | 0.780 |  |
| ap-southeast-4 | 0.664 |  |
| ap-southeast-5 | 0.755 |  |
| ap-southeast-6 | 0.657 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.272 | 18 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.546 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.587 |  |
| eu-west-1 | 0.468 |  |
| eu-west-2 | 0.505 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.212 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.212 | 5044 |
| us-east-2 | 0.227 | 1681 |
| us-gov-east-1 | 0.202 | 1869 |
| us-gov-west-1 | 0.156 | 225 |
| us-west-1 | 0.092 | 4020 |
| us-west-2 | 0.154 | 184 |

