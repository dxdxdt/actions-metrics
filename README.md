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
Updated: 2026-05-02T11:39:42.084628+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.787 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.822 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.797 |  |
| ap-southeast-3 | 0.920 |  |
| ap-southeast-4 | 0.828 |  |
| ap-southeast-5 | 0.891 |  |
| ap-southeast-6 | 0.859 |  |
| ap-southeast-7 | 0.965 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.416 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.430 |  |
| eu-west-1 | 0.319 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.501 |  |
| us-east-1 | 0.070 | 4585 |
| us-east-2 | 0.092 | 1556 |
| us-gov-east-1 | 0.096 | 1670 |
| us-gov-west-1 | 0.317 | 194 |
| us-west-1 | 0.253 | 3516 |
| us-west-2 | 0.311 | 157 |

