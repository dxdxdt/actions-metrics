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
Updated: 2026-05-04T19:17:47.644155+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.718 |  |
| ap-northeast-1 | 0.623 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.850 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.873 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.433 |  |
| eu-north-1 | 0.475 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.369 |  |
| eu-west-3 | 0.403 |  |
| il-central-1 | 0.574 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.513 |  |
| us-east-1 | 0.071 | 4593 |
| us-east-2 | 0.082 | 1566 |
| us-gov-east-1 | 0.096 | 1673 |
| us-gov-west-1 | 0.307 | 194 |
| us-west-1 | 0.239 | 3531 |
| us-west-2 | 0.292 | 157 |

