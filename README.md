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
Updated: 2026-03-07T05:34:56.728369+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.646 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.685 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.684 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.225 | 16 |
| ca-west-1 | 0.194 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.581 |  |
| eu-south-1 | 0.549 |  |
| eu-south-2 | 0.563 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.485 |  |
| eu-west-3 | 0.511 |  |
| il-central-1 | 0.698 |  |
| me-central-1 | 0.904 |  |
| me-south-1 | 0.862 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.646 |  |
| us-east-1 | 0.189 | 4233 |
| us-east-2 | 0.169 | 1406 |
| us-gov-east-1 | 0.173 | 1534 |
| us-gov-west-1 | 0.160 | 174 |
| us-west-1 | 0.131 | 3188 |
| us-west-2 | 0.159 | 142 |

