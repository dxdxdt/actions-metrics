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
Updated: 2026-08-12T14:15:58.201934+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.017 |  |
| ap-east-1 | 0.655 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.584 |  |
| ap-northeast-3 | 0.498 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.646 |  |
| ap-southeast-3 | 0.791 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.751 |  |
| ap-southeast-6 | 0.690 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.274 | 18 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.540 |  |
| eu-central-2 | 0.572 |  |
| eu-north-1 | 0.612 |  |
| eu-south-1 | 0.569 |  |
| eu-south-2 | 0.577 |  |
| eu-west-1 | 0.461 |  |
| eu-west-2 | 0.505 |  |
| eu-west-3 | 0.525 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.199 | 4978 |
| us-east-2 | 0.220 | 1679 |
| us-gov-east-1 | 0.241 | 1822 |
| us-gov-west-1 | 0.159 | 221 |
| us-west-1 | 0.129 | 3931 |
| us-west-2 | 0.160 | 176 |

