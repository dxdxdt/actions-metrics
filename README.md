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
Updated: 2026-04-09T16:59:26.673313+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.865 |  |
| ap-east-1 | 0.811 |  |
| ap-east-2 | 0.752 |  |
| ap-northeast-1 | 0.633 |  |
| ap-northeast-2 | 0.734 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.883 |  |
| ap-southeast-2 | 0.824 |  |
| ap-southeast-3 | 0.945 |  |
| ap-southeast-4 | 0.866 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.876 |  |
| ap-southeast-7 | 0.989 |  |
| ca-central-1 | 0.098 | 16 |
| ca-west-1 | 0.294 |  |
| eu-central-1 | 0.380 |  |
| eu-central-2 | 0.391 |  |
| eu-north-1 | 0.429 |  |
| eu-south-1 | 0.399 |  |
| eu-south-2 | 0.416 |  |
| eu-west-1 | 0.300 |  |
| eu-west-2 | 0.331 |  |
| eu-west-3 | 0.360 |  |
| il-central-1 | 0.547 |  |
| me-central-1 | 0.749 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.474 |  |
| us-east-1 | 0.045 | 4467 |
| us-east-2 | 0.091 | 1489 |
| us-gov-east-1 | 0.085 | 1636 |
| us-gov-west-1 | 0.325 | 192 |
| us-west-1 | 0.282 | 3382 |
| us-west-2 | 0.327 | 154 |

