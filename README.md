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
Updated: 2026-05-02T23:36:06.381712+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.667 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.809 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.769 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.136 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.509 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.624 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.114 | 4586 |
| us-east-2 | 0.088 | 1559 |
| us-gov-east-1 | 0.088 | 1671 |
| us-gov-west-1 | 0.235 | 194 |
| us-west-1 | 0.177 | 3522 |
| us-west-2 | 0.229 | 157 |

