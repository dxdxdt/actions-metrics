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
Updated: 2026-08-28T20:32:58.171075+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.720 |  |
| ap-northeast-1 | 0.608 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.632 |  |
| ap-south-1 | 0.848 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.864 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.884 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.950 |  |
| ca-central-1 | 0.156 | 18 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.444 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.450 |  |
| eu-south-2 | 0.453 |  |
| eu-west-1 | 0.345 |  |
| eu-west-2 | 0.378 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.523 |  |
| us-east-1 | 0.085 | 5073 |
| us-east-2 | 0.116 | 1684 |
| us-gov-east-1 | 0.124 | 1887 |
| us-gov-west-1 | 0.278 | 228 |
| us-west-1 | 0.230 | 4065 |
| us-west-2 | 0.286 | 189 |

