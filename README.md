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
Updated: 2026-04-01T16:03:28.868034+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.082 |  |
| ap-east-1 | 0.623 |  |
| ap-east-2 | 0.561 |  |
| ap-northeast-1 | 0.446 |  |
| ap-northeast-2 | 0.553 |  |
| ap-northeast-3 | 0.471 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.701 |  |
| ap-southeast-2 | 0.575 |  |
| ap-southeast-3 | 0.756 |  |
| ap-southeast-4 | 0.614 |  |
| ap-southeast-5 | 0.722 |  |
| ap-southeast-6 | 0.654 |  |
| ap-southeast-7 | 0.806 |  |
| ca-central-1 | 0.324 | 16 |
| ca-west-1 | 0.175 |  |
| eu-central-1 | 0.597 |  |
| eu-central-2 | 0.631 |  |
| eu-north-1 | 0.675 |  |
| eu-south-1 | 0.646 |  |
| eu-south-2 | 0.653 |  |
| eu-west-1 | 0.528 |  |
| eu-west-2 | 0.595 |  |
| eu-west-3 | 0.585 |  |
| il-central-1 | 0.784 |  |
| me-central-1 | 0.979 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.772 |  |
| us-east-1 | 0.267 | 4414 |
| us-east-2 | 0.236 | 1470 |
| us-gov-east-1 | 0.233 | 1618 |
| us-gov-west-1 | 0.102 | 190 |
| us-west-1 | 0.047 | 3332 |
| us-west-2 | 0.103 | 153 |

