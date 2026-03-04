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
Updated: 2026-03-04T18:37:59.609666+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.695 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.602 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.753 |  |
| ap-southeast-3 | 0.888 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.149 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.463 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.788 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.101 | 4219 |
| us-east-2 | 0.127 | 1397 |
| us-gov-east-1 | 0.120 | 1530 |
| us-gov-west-1 | 0.253 | 170 |
| us-west-1 | 0.211 | 3172 |
| us-west-2 | 0.266 | 140 |

