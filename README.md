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
Updated: 2026-02-18T21:29:16.557678+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.059 |  |
| ap-east-1 | 0.646 |  |
| ap-east-2 | 0.586 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.574 |  |
| ap-northeast-3 | 0.497 |  |
| ap-south-1 | 0.948 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.721 |  |
| ap-southeast-2 | 0.618 |  |
| ap-southeast-3 | 0.776 |  |
| ap-southeast-4 | 0.657 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.696 |  |
| ap-southeast-7 | 0.824 |  |
| ca-central-1 | 0.265 | 16 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.568 |  |
| eu-central-2 | 0.591 |  |
| eu-north-1 | 0.625 |  |
| eu-south-1 | 0.595 |  |
| eu-south-2 | 0.608 |  |
| eu-west-1 | 0.486 |  |
| eu-west-2 | 0.526 |  |
| eu-west-3 | 0.557 |  |
| il-central-1 | 0.761 |  |
| me-central-1 | 0.935 |  |
| me-south-1 | 0.904 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.660 |  |
| us-east-1 | 0.225 | 4139 |
| us-east-2 | 0.200 | 1354 |
| us-gov-east-1 | 0.193 | 1491 |
| us-gov-west-1 | 0.128 | 155 |
| us-west-1 | 0.104 | 3076 |
| us-west-2 | 0.131 | 128 |

