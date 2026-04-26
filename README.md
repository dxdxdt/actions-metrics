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
Updated: 2026-04-26T20:31:06.436713+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.983 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.640 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.920 |  |
| ap-south-2 | 0.975 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.836 |  |
| ap-southeast-4 | 0.732 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.197 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.517 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.464 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.665 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.192 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.154 | 4568 |
| us-east-2 | 0.141 | 1536 |
| us-gov-east-1 | 0.131 | 1665 |
| us-gov-west-1 | 0.204 | 194 |
| us-west-1 | 0.151 | 3487 |
| us-west-2 | 0.203 | 157 |

