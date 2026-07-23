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
Updated: 2026-07-23T08:15:10.095355+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.998 |  |
| ap-east-1 | 0.689 |  |
| ap-east-2 | 0.632 |  |
| ap-northeast-1 | 0.511 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.537 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.654 |  |
| ap-southeast-3 | 0.824 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.703 |  |
| ap-southeast-7 | 0.872 |  |
| ca-central-1 | 0.252 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.552 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.491 |  |
| il-central-1 | 0.682 |  |
| me-central-1 | 0.899 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.184 | 4901 |
| us-east-2 | 0.188 | 1660 |
| us-gov-east-1 | 0.193 | 1775 |
| us-gov-west-1 | 0.181 | 206 |
| us-west-1 | 0.123 | 3821 |
| us-west-2 | 0.181 | 167 |

