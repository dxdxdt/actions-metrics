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
Updated: 2026-07-16T04:54:00.712720+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.000 |  |
| ap-east-1 | 0.683 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.505 |  |
| ap-northeast-2 | 0.610 |  |
| ap-northeast-3 | 0.530 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.906 |  |
| ap-southeast-1 | 0.759 |  |
| ap-southeast-2 | 0.654 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.701 |  |
| ap-southeast-5 | 0.781 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.866 |  |
| ca-central-1 | 0.228 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.545 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.544 |  |
| eu-west-1 | 0.433 |  |
| eu-west-2 | 0.486 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.921 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.176 | 4872 |
| us-east-2 | 0.202 | 1656 |
| us-gov-east-1 | 0.170 | 1756 |
| us-gov-west-1 | 0.189 | 202 |
| us-west-1 | 0.128 | 3785 |
| us-west-2 | 0.195 | 166 |

