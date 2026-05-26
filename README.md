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
Updated: 2026-05-26T03:26:13.564954+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.070 |  |
| ap-east-1 | 0.632 |  |
| ap-east-2 | 0.567 |  |
| ap-northeast-1 | 0.451 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.476 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.708 |  |
| ap-southeast-2 | 0.599 |  |
| ap-southeast-3 | 0.762 |  |
| ap-southeast-4 | 0.639 |  |
| ap-southeast-5 | 0.728 |  |
| ap-southeast-6 | 0.642 |  |
| ap-southeast-7 | 0.817 |  |
| ca-central-1 | 0.306 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.569 |  |
| eu-central-2 | 0.595 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.613 |  |
| eu-south-2 | 0.599 |  |
| eu-west-1 | 0.494 |  |
| eu-west-2 | 0.538 |  |
| eu-west-3 | 0.545 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.974 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.696 |  |
| us-east-1 | 0.243 | 4688 |
| us-east-2 | 0.224 | 1611 |
| us-gov-east-1 | 0.221 | 1706 |
| us-gov-west-1 | 0.128 | 195 |
| us-west-1 | 0.069 | 3604 |
| us-west-2 | 0.129 | 160 |

