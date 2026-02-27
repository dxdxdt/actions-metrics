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
Updated: 2026-02-27T09:34:02.254207+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.687 |  |
| ap-northeast-1 | 0.569 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.844 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.187 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.519 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.811 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.135 | 4194 |
| us-east-2 | 0.144 | 1381 |
| us-gov-east-1 | 0.147 | 1513 |
| us-gov-west-1 | 0.238 | 162 |
| us-west-1 | 0.206 | 3130 |
| us-west-2 | 0.243 | 133 |

