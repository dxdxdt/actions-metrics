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
Updated: 2025-07-31T15:15:16.657872+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.776 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.687 |  |
| ap-south-1 | 0.883 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.734 |  |
| ca-central-1 | 0.138 | 11 |
| eu-central-1 | 0.469 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.496 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.432 |  |
| me-south-1 | 0.879 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.114 | 2599 |
| us-east-2 | 0.113 | 665 |
| us-gov-east-1 | 0.111 | 837 |
| us-gov-west-1 | 0.236 | 2 |
| us-west-1 | 0.216 | 1770 |
| us-west-2 | 0.238 |  |

