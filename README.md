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
Updated: 2026-06-18T16:55:27.903718+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.902 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.709 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.860 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.902 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.799 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.417 |  |
| eu-central-2 | 0.440 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.447 |  |
| eu-south-2 | 0.453 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.584 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.087 | 4769 |
| us-east-2 | 0.110 | 1635 |
| us-gov-east-1 | 0.106 | 1714 |
| us-gov-west-1 | 0.283 | 198 |
| us-west-1 | 0.231 | 3677 |
| us-west-2 | 0.275 | 163 |

