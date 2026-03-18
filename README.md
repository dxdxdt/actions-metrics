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
Updated: 2026-03-18T19:44:18.502542+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.851 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.915 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.826 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.151 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.353 |  |
| eu-west-2 | 0.388 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.614 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.785 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.531 |  |
| us-east-1 | 0.095 | 4306 |
| us-east-2 | 0.113 | 1433 |
| us-gov-east-1 | 0.127 | 1586 |
| us-gov-west-1 | 0.272 | 189 |
| us-west-1 | 0.212 | 3251 |
| us-west-2 | 0.274 | 148 |

