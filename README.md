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
Updated: 2026-10-12T08:27:57.757919+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.920 |  |
| ap-east-1 | 0.763 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.608 |  |
| ap-south-1 | 0.882 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.900 |  |
| ap-southeast-4 | 0.779 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.138 | 18 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.456 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.446 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.391 |  |
| eu-west-3 | 0.411 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.544 |  |
| us-east-1 | 0.098 | 5144 |
| us-east-2 | 0.100 | 1695 |
| us-gov-east-1 | 0.113 | 1939 |
| us-gov-west-1 | 0.256 | 237 |
| us-west-1 | 0.201 | 4167 |
| us-west-2 | 0.254 | 194 |

