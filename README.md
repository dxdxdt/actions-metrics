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
Updated: 2026-08-15T06:23:25.282162+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.055 |  |
| ap-east-1 | 0.631 |  |
| ap-east-2 | 0.573 |  |
| ap-northeast-1 | 0.453 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.481 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.707 |  |
| ap-southeast-2 | 0.585 |  |
| ap-southeast-3 | 0.762 |  |
| ap-southeast-4 | 0.625 |  |
| ap-southeast-5 | 0.725 |  |
| ap-southeast-6 | 0.621 |  |
| ap-southeast-7 | 0.805 |  |
| ca-central-1 | 0.301 | 18 |
| ca-west-1 | 0.172 |  |
| eu-central-1 | 0.581 |  |
| eu-central-2 | 0.604 |  |
| eu-north-1 | 0.623 |  |
| eu-south-1 | 0.613 |  |
| eu-south-2 | 0.605 |  |
| eu-west-1 | 0.508 |  |
| eu-west-2 | 0.534 |  |
| eu-west-3 | 0.561 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.949 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.698 |  |
| us-east-1 | 0.249 | 4998 |
| us-east-2 | 0.251 | 1679 |
| us-gov-east-1 | 0.223 | 1829 |
| us-gov-west-1 | 0.113 | 222 |
| us-west-1 | 0.056 | 3953 |
| us-west-2 | 0.114 | 177 |

