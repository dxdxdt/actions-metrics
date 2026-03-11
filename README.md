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
Updated: 2026-03-11T01:16:49.970660+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.915 |  |
| ap-east-1 | 0.764 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.703 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.868 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.773 |  |
| ap-southeast-3 | 0.902 |  |
| ap-southeast-4 | 0.813 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.839 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.135 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.472 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.345 |  |
| eu-west-2 | 0.381 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.604 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.762 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.086 | 4257 |
| us-east-2 | 0.104 | 1417 |
| us-gov-east-1 | 0.105 | 1556 |
| us-gov-west-1 | 0.266 | 178 |
| us-west-1 | 0.240 | 3207 |
| us-west-2 | 0.285 | 144 |

