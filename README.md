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
Updated: 2026-04-05T08:35:29.362436+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.868 |  |
| ap-east-1 | 0.805 |  |
| ap-east-2 | 0.745 |  |
| ap-northeast-1 | 0.629 |  |
| ap-northeast-2 | 0.742 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.828 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.796 |  |
| ap-southeast-3 | 0.934 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.830 |  |
| ap-southeast-7 | 0.987 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.304 |  |
| eu-central-1 | 0.380 |  |
| eu-central-2 | 0.405 |  |
| eu-north-1 | 0.429 |  |
| eu-south-1 | 0.408 |  |
| eu-south-2 | 0.410 |  |
| eu-west-1 | 0.294 |  |
| eu-west-2 | 0.339 |  |
| eu-west-3 | 0.363 |  |
| il-central-1 | 0.555 |  |
| me-central-1 | 0.757 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.476 |  |
| us-east-1 | 0.051 | 4438 |
| us-east-2 | 0.084 | 1482 |
| us-gov-east-1 | 0.091 | 1628 |
| us-gov-west-1 | 0.314 | 191 |
| us-west-1 | 0.255 | 3356 |
| us-west-2 | 0.319 | 153 |

