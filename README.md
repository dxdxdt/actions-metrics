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
Updated: 2026-08-17T15:18:25.731712+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.735 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.663 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.852 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.704 |  |
| ap-southeast-3 | 0.863 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.910 |  |
| ca-central-1 | 0.196 | 18 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.508 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.389 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.138 | 5012 |
| us-east-2 | 0.155 | 1680 |
| us-gov-east-1 | 0.146 | 1839 |
| us-gov-west-1 | 0.231 | 224 |
| us-west-1 | 0.171 | 3977 |
| us-west-2 | 0.223 | 181 |

