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
Updated: 2026-11-01T20:00:41.627603+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.771 |  |
| ap-east-1 | 0.496 |  |
| ap-east-2 | 0.453 |  |
| ap-northeast-1 | 0.362 |  |
| ap-northeast-2 | 0.440 |  |
| ap-northeast-3 | 0.382 |  |
| ap-south-1 | 0.677 |  |
| ap-south-2 | 0.696 |  |
| ap-southeast-1 | 0.552 |  |
| ap-southeast-2 | 0.499 |  |
| ap-southeast-3 | 0.595 |  |
| ap-southeast-4 | 0.553 |  |
| ap-southeast-5 | 0.568 |  |
| ap-southeast-6 | 0.513 |  |
| ap-southeast-7 | 0.631 |  |
| ca-central-1 | 0.166 | 18 |
| ca-west-1 | 0.164 |  |
| eu-central-1 | 0.402 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.436 |  |
| eu-south-1 | 0.408 |  |
| eu-south-2 | 0.416 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.513 |  |
| me-central-1 | 0.662 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.180 |  |
| sa-east-1 | 0.499 |  |
| us-east-1 | 0.153 | 5168 |
| us-east-2 | 0.137 | 1719 |
| us-gov-east-1 | 0.143 | 1958 |
| us-gov-west-1 | 0.111 | 242 |
| us-west-1 | 0.110 | 4203 |
| us-west-2 | 0.112 | 195 |

