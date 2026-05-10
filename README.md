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
Updated: 2026-05-10T08:02:43.061393+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.776 |  |
| ap-east-2 | 0.715 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.811 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.856 |  |
| ap-southeast-7 | 0.954 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.411 |  |
| eu-central-2 | 0.435 |  |
| eu-north-1 | 0.462 |  |
| eu-south-1 | 0.439 |  |
| eu-south-2 | 0.441 |  |
| eu-west-1 | 0.341 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.573 |  |
| me-central-1 | 0.785 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.073 | 4619 |
| us-east-2 | 0.083 | 1582 |
| us-gov-east-1 | 0.089 | 1684 |
| us-gov-west-1 | 0.295 | 195 |
| us-west-1 | 0.240 | 3547 |
| us-west-2 | 0.296 | 157 |

