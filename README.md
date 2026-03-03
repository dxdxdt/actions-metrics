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
Updated: 2026-03-03T01:23:40.762060+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.930 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.684 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.789 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.839 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.486 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.365 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.769 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.083 | 4211 |
| us-east-2 | 0.071 | 1392 |
| us-gov-east-1 | 0.068 | 1524 |
| us-gov-west-1 | 0.244 | 168 |
| us-west-1 | 0.248 | 3161 |
| us-west-2 | 0.238 | 136 |

